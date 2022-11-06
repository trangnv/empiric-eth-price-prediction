%lang starknet
struct Checkpoint {
    timestamp: felt,
    value: felt,
    aggregation_mode: felt,
    num_sources_aggregated: felt,
}
@contract_interface
namespace IEmpiricOracle {
    func get_spot_median(pair_id: felt) -> (
        price: felt,
        decimals: felt,
        last_updated_timestamp: felt,
        num_sources_aggregated: felt
    ) {
    }
    func get_latest_checkpoint_index(key: felt) -> (latest: felt) {
    }
    func get_checkpoint(key: felt, index: felt) -> (checkpoint: Checkpoint) {
    }
}