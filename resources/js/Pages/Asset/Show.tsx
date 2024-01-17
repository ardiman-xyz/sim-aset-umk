import Authenticated from "@/Layouts/AuthenticatedLayout";
import { AcquisitionMethod, Asset, Category, Condition } from "@/types/app";
import { Head } from "@inertiajs/react";
import ImagesDetail from "./_components/images-detail";
import DetailItem from "./_components/detail";
import ActionButton from "./_components/action-button";
import Placement from "./_components/placement";
import { usePlacementStore } from "@/Context/usePlacement";
import { useEffect } from "react";

interface ShowPageProps {
    asset: Asset;
    conditions: Condition[];
    acquisitionMethods: AcquisitionMethod[];
    categories: Category[];
    buildings: {
        value: number;
        label: string;
    }[];
}

const ShowPage = ({
    asset,
    conditions,
    acquisitionMethods,
    categories,
    buildings,
}: ShowPageProps) => {
    const { setBuilding } = usePlacementStore();

    useEffect(() => {
        setBuilding(buildings);
    }, []);

    return (
        <Authenticated>
            <Head title={asset.name} />

            <div className="w-full flex items-center justify-between bg-white rounded-sm mb-4 p-4">
                <h1 className="font-bold text-lg">{asset.name}</h1>
                <ActionButton />
            </div>
            <div className="w-full flex flex-row md:gap-x-6">
                <div className="w-1/3">
                    <ImagesDetail images={asset.gallery} />
                </div>
                <div className="w-2/3 flex flex-col gap-y-8">
                    <DetailItem
                        acquisitionMethods={acquisitionMethods}
                        conditions={conditions}
                        asset={asset}
                        categories={categories}
                    />

                    <Placement datas={asset.placements} />
                </div>
            </div>
        </Authenticated>
    );
};

export default ShowPage;
