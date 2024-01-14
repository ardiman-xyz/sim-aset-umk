import Authenticated from "@/Layouts/AuthenticatedLayout";
import { Asset } from "@/types/app";
import { SharedInertiaData } from "@/types/inertia";
import { Head, usePage } from "@inertiajs/react";
import ImagesDetail from "./_components/images-detail";
import DetailItem from "./_components/detail";

interface ShowPageProps {
    asset: Asset;
}

const ShowPage = ({ asset }: ShowPageProps) => {
    console.info(asset);

    return (
        <Authenticated>
            <Head title="Detail" />

            <div className="w-full flex flex-row md:gap-x-6">
                <div className="w-1/3">
                    <ImagesDetail images={asset.gallery} />
                    <h1 className="text-center mt-6 font-semibold">
                        {asset.name}
                    </h1>
                </div>
                <div className="w-2/3">
                    <DetailItem asset={asset} />
                </div>
            </div>
        </Authenticated>
    );
};

export default ShowPage;
