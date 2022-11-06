%lang starknet
from starkware.cairo.common.cairo_builtins import HashBuiltin

// from contracts.protocol.libraries.types.data_types import DataTypes

@storage_var
func ContractStorage_price_array() -> (res: felt) {
}

namespace ContractStorage {
    func price_array_read{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
        ) -> (array: felt) {
        let (array) = ContractStorage_price_array.read();
        return (array=array);
    }
}
