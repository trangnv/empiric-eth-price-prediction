%lang starknet

from starkware.cairo.common.math_cmp import is_le
from starkware.cairo.common.math import unsigned_div_rem//, assert_le, assert_250_bit

from starkware.cairo.common.pow import pow
from starkware.cairo.common.cairo_builtins import HashBuiltin

from contracts.oracle.ISummaryStats import ISummaryStats
from contracts.oracle.IEmpiricOracle import IEmpiricOracle

from contracts.contract_storage import ContractStorage
from contracts.libraries.helpers.helpers import array_sum

from contracts.libraries.helpers.constants import EMPIRIC_VOL_ADDRESS, KEY, decimals, N


func get_latest_checkpoint_index{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
) -> (latest_index: felt){
    let (latest_index) = IEmpiricOracle.get_latest_checkpoint_index(contract_address=EMPIRIC_VOL_ADDRESS, key=KEY);
    return (latest_index=latest_index);
}

@view
func view_latest_checkpoint_price{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (res: felt) {
    let (res) = ContractStorage.price_array_read();
    return (res=res);
}

func storage_historical_prices{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(){
    alloc_locals;
    let (latest_index) = get_latest_checkpoint_index();
    let (latest_price) = ContractStorage.price_array_read();
    let latest_price_ptr = cast([latest_price], felt*);
    write_array(latest_price_ptr, N, latest_index);
    return ();
}

func write_array{syscall_ptr: felt*, range_check_ptr}(
    array: felt*, array_len: felt, index: felt
) {
    if (array_len==0) {
        return();
    }
    let (checkpoint) = IEmpiricOracle.get_checkpoint(contract_address=EMPIRIC_VOL_ADDRESS, key=KEY,index=index);
    assert [array]=checkpoint.value;
    return write_array(array+1, array_len-1, index-1);
}

@view
func predict_next_price{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (res: felt) {
    alloc_locals;
    storage_historical_prices();
    let (latest_price) = ContractStorage.price_array_read();
    let latest_price_ptr = cast([latest_price], felt*);
    let sum = array_sum(latest_price_ptr, N);
    let (price_avg, rem) = unsigned_div_rem(sum, N);

    return (res=price_avg);
}

