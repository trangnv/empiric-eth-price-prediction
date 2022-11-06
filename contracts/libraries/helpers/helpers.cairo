func array_sum(arr: felt*, size) -> felt {
    if (size == 0) {
        return 0;
    }
    // size is not zero.
    let sum_of_rest = array_sum(arr=arr + 1, size=size - 1);
    return arr[0] + sum_of_rest;
}