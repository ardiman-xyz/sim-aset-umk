import { Card, CardContent, CardHeader } from "@/Components/ui/card";
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/Components/ui/select";

import { Chart } from "react-google-charts";

const AssetsPurchaseChart = () => {
    const data = [
        ["Bulan", "Jumlah Barang", "Total Budget"],
        ["Jan", 100, 400],
        ["Feb", 150, 500],
    ];

    const options = {
        vAxis: { title: "Cups" },
        hAxis: { title: "Month" },
        seriesType: "bars",
        series: { 5: { type: "line" } },
    };

    return (
        <Card className="border-none shadow-none">
            <CardHeader>
                <div className="flex flex-row justify-between">
                    <h1 className="text-lg text-zinc-600 ">
                        Riwayat Pembelian Aset
                    </h1>
                    <Select>
                        <SelectTrigger className="w-[180px]">
                            <SelectValue placeholder="Bulan" />
                        </SelectTrigger>
                        <SelectContent>
                            <SelectItem value="light">Bulan</SelectItem>
                            <SelectItem value="dark">Tahun</SelectItem>
                        </SelectContent>
                    </Select>
                </div>
            </CardHeader>
            <CardContent>
                <Chart
                    chartType="ComboChart"
                    width="100%"
                    height="400px"
                    data={data}
                    options={options}
                />
            </CardContent>
        </Card>
    );
};

export default AssetsPurchaseChart;
