import { Head } from "@inertiajs/react";
import { AssetsPerMonth } from "@/types/app";

import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import Cards from "./_components/cards";
import AssetsPurchaseChart from "./_components/AssetsPurchaseChart";
import DistributionItems from "./_components/DistributionItems";
import { useChartGroupingStore } from "@/Context/useChartGroupingState";
import { useEffect, useState } from "react";
import Spinner from "@/Components/Spinner";
import axios from "axios";

export default function Index() {
    const { grouping, setGrouping } = useChartGroupingStore();
    const [isLoading, setIsLoading] = useState<boolean>(false);
    const [assets, setAssets] = useState<AssetsPerMonth[] | []>([]);
    const [userCount, setUserCount] = useState<number>(0);
    const [assetActiveCoount, setAssetActiveCoount] = useState<number>(0);
    const [totalExpenditures, setTotalExpenditures] = useState<number>(0);

    const onToggle = () => {
        if (grouping === "month") {
            setGrouping("year");
        } else {
            setGrouping("month");
        }
    };

    useEffect(() => {
        const fetchData = async () => {
            setIsLoading(true);

            await axios.get("/data?grouping=" + grouping).then(({ data }) => {
                setAssets(data.assets);
                setUserCount(data.users);
                setAssetActiveCoount(data.activeAssets);
                setTotalExpenditures(data.totalExpenditures);
            });

            setIsLoading(false);
        };

        fetchData();
    }, [grouping]);

    return (
        <AuthenticatedLayout
            breadCrumbs={[
                {
                    title: "Dasbor",
                    url: "dashboard",
                    disabled: true,
                },
            ]}
        >
            <Head title="Dashboard" />
            <div className="pb-[200px]">
                <h1 className="font-medium text-2xl">Admin Dashboard</h1>

                <div className="mt-4">
                    <Cards
                        userCount={userCount}
                        assetCount={assetActiveCoount}
                        totalExpenditures={totalExpenditures}
                    />
                </div>

                <div className="w-full flex items-center justify-between mt-5">
                    <p className="text-sm text-zinc-600">Result data</p>
                    <select
                        disabled={isLoading}
                        onChange={onToggle}
                        className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-[100px] p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 "
                    >
                        <option selected={grouping === "month"} value="month">
                            Bulan
                        </option>
                        <option value="year" selected={grouping === "year"}>
                            Tahun
                        </option>
                    </select>
                </div>

                {isLoading && (
                    <div className="w-full flex items-center justify-center flex-col gap-y-2">
                        <Spinner />
                        <p className="text-sm text-zinc-500">Load data</p>
                    </div>
                )}

                {!isLoading && (
                    <div className="mt-5 flex flex-row md:gap-x-4 gap-x-0">
                        <div className="w-2/3">
                            <AssetsPurchaseChart datas={assets} />
                        </div>
                        <div className="w-1/3">
                            <div>
                                <DistributionItems />
                            </div>
                            <div className="mt-6">
                                {/* item jumlah gedung here */}
                            </div>
                        </div>
                    </div>
                )}
            </div>
        </AuthenticatedLayout>
    );
}
