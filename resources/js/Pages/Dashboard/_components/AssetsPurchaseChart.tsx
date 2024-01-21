import { History } from "lucide-react";
import { AssetsPerMonth } from "@/types/app";
import { Chart } from "react-google-charts";

import { Card, CardContent, CardHeader } from "@/Components/ui/card";
import { useChartGroupingStore } from "@/Context/useChartGroupingState";

interface IProps {
    datas: AssetsPerMonth[];
}

const AssetsPurchaseChart = ({ datas }: IProps) => {
    const { grouping } = useChartGroupingStore();
    const isMonthly = grouping === "month";

    let chartData = [];

    chartData.push(["Periode", "Jumlah Barang"]);

    let periods = [];

    if (isMonthly) {
        let monthOrder = [
            "January",
            "February",
            "March",
            "April",
            "May",
            "June",
            "July",
            "August",
            "September",
            "October",
            "November",
            "December",
        ];

        periods = monthOrder;

        periods.forEach((period) => {
            let data = datas.find((d) => d.period === period);

            if (data) {
                chartData.push([data.period, Number(data.total_quantity)]);
            }
        });
    } else {
        // ambil tahun dari data
        periods = datas.map((d) => d.period);

        periods.forEach((period) => {
            let data = datas.find((d) => d.period === period);

            if (data) {
                chartData.push([
                    String(data.period),
                    Number(data.total_quantity),
                ]);
            }
        });
    }

    // console.info(datas);

    const options = {
        series: { 5: { type: "line" } },
    };

    return (
        <Card className="border-none shadow-none">
            <CardHeader>
                <div className="flex flex-row justify-between">
                    <h1 className="text-lg text-zinc-600 ">
                        Riwayat Pembelian Aset
                    </h1>
                </div>
            </CardHeader>
            <CardContent>
                <Chart
                    chartType="Bar"
                    width="100%"
                    height="400px"
                    data={chartData}
                    options={options}
                />

                <div className="w-full">
                    <div className="flex flex-row items-center gap-x-2">
                        <History className="w-4 h-4 fill-slate-300 stroke-slate-500" />
                        <h4 className="text-zinc-600 text-sm">List detail</h4>
                    </div>

                    <div className="w-full mt-4">hello</div>
                </div>
            </CardContent>
        </Card>
    );
};

export default AssetsPurchaseChart;
