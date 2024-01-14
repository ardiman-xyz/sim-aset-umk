import Authenticated from "@/Layouts/AuthenticatedLayout";
import {Head} from "@inertiajs/react";
import {FooterAction} from "./_components/footer-action";
import {Information} from "./_components/information";

interface CreateProps {
    acquisitionMethods: {
        id: number;
        name: string;
    }[];
    categories: {
        id: number;
        name: string;
    }[];
    conditions: {
        id: number;
        name: string;
    }[]
}

const AssetCreatePage = ({acquisitionMethods, categories, conditions}: CreateProps) => {

    const breadCrumb = [
        {
            title : "Aset",
            url: "asset.index",
            disabled: false
        },
        {
            title : "Buat aset baru",
            url: "",
            disabled: true
        },
    ];

    return (
        <Authenticated breadCrumbs={breadCrumb}>
            <Head title="Buat aset baru" />
            <div className="w-full container max-w-5xl mx-auto">
                <Information
                    acquisitionMethods={acquisitionMethods}
                    categories={categories}
                    conditions={conditions}
                />
                {/*<FooterAction />*/}
            </div>
        </Authenticated>
    )
}

export default AssetCreatePage;
