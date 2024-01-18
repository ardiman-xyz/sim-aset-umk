import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { Head } from "@inertiajs/react";
import Cards from "./_components/cards";
import AssetsPurchaseChart from "./_components/AssetsPurchaseChart";
import DistributionItems from "./_components/DistributionItems";

export default function Index() {
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
            <div>
                <h1 className="font-medium text-2xl">Admin Dashboard</h1>

                <div className="mt-4">
                    <Cards />
                </div>
                <div className="mt-10 flex flex-row md:gap-x-4 gap-x-0">
                    <div className="w-2/3">
                        <AssetsPurchaseChart />
                    </div>
                    <div className="w-1/3">
                        <DistributionItems />
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
