import Gurobi
import InfrastructureModels
import JSON
import JuMP
import Memento
import Statistics

using GasPowerModels
const GPM = GasPowerModels

# Decrease verbosity of logging messages.
Memento.setlevel!(Memento.getlogger(GPM), "error")
Memento.setlevel!(Memento.getlogger(GPM._GM), "error")
Memento.setlevel!(Memento.getlogger(GPM._PMR), "error")
Memento.setlevel!(Memento.getlogger(GPM._PM), "error")
Memento.setlevel!(Memento.getlogger(GPM._IM), "error")

# Instantiate the optimizer.
env = Gurobi.Env()
optimizer = JuMP.optimizer_with_attributes(() -> Gurobi.Optimizer(env), "OutputFlag" => 0)

# Read in multi-infrastructure network data.
base_data = parse_files(
	"data/gaspowermodels-mld/NG146.m",
	"data/gaspowermodels-mld/EP36.m",
	"data/gaspowermodels-mld/NG146-EP36.json"
)

function solve_damage_scenario(scenario_path::String, weight::Float64)
    # Copy the original network data and apply the damage scenario.
    data = deepcopy(base_data)
    modifications = JSON.parsefile(scenario_path)
    InfrastructureModels.update_data!(data, modifications)
    correct_network_data!(data)

    # Solve the damage scenario using gas and power model relaxations.
    gpm_type = GasPowerModel{CRDWPGasModel, SOCWRPowerModel}
    return solve_mld(data, gpm_type, build_mld_uc, optimizer, weight);
end

# Instantiate metadata used to compute mean load deliveries.
base_gas_load = 402.3281133902598
base_power_load = 138709.54000000004
active_power_served = Dict{Float64,Any}()
gas_load_nonpower_served = Dict{Float64,Any}()

# Write a header for the data that is to be printed.
println("weight,percent_gas_delivered,percent_power_delivered")

for weight = [0.0, 0.381, 0.5, 0.605, 0.61, 1.0]
    # Instantiate vectors of load data to be stored for each damage scenario.
    active_power_served[weight] = Vector{Float64}([])
    gas_load_nonpower_served[weight] = Vector{Float64}([])

    for file_path = filter(s -> occursin("dmg_", s), readdir("data/gaspowermodels-mld"))
        # Solve the MLD problem with the damage scenario applied.
	    result = solve_damage_scenario("data/gaspowermodels-mld/$(file_path)", weight)

        if string(result["termination_status"]) == "OPTIMAL"
            # If the problem was solved to optimality, store the result.
            push!(active_power_served[weight], result["active_power_served"])
            push!(gas_load_nonpower_served[weight], result["gas_load_nonpower_served"])
        end
    end

    # Compute and print the mean percent load deliveries over all scenarios for a particular weight.
    percent_power_delivered = 100.0 * Statistics.mean(active_power_served[weight]) / base_power_load
    percent_gas_delivered = 100.0 * Statistics.mean(gas_load_nonpower_served[weight]) / base_gas_load
    println(weight, ",", percent_gas_delivered, ",", percent_power_delivered)
end
