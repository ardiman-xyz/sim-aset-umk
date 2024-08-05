export function formatRupiah(num: number) {
    return "Rp " + num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
}

export function formatNumber(value: number): string {
    if (value >= 1_000_000_000) {
        return (
            (value / 1_000_000_000).toFixed(1).replace(/\.0$/, "") + " Miliar"
        );
    } else if (value >= 1_000_000) {
        return (value / 1_000_000).toFixed(1).replace(/\.0$/, "") + " Juta";
    } else if (value >= 1_000) {
        return (value / 1_000).toFixed(1).replace(/\.0$/, "") + " Ribu";
    } else {
        return value.toString();
    }
}
