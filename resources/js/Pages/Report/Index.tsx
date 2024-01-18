import { Head } from "@inertiajs/react";

import Authenticated from "@/Layouts/AuthenticatedLayout";
import FilterForm from "./_components/filter-form";
import { useState } from "react";
import axios from "axios";
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/Components/ui/card";
import Result from "./_components/Resut";
import { Asset } from "@/types/app";
import { RotateCw } from "lucide-react";

interface IProps {
    buildings: {
        value: number;
        label: string;
    }[];
}

interface OptionValue {
    value: number;
    label: string;
}

interface FilterValues {
    building: OptionValue;
    floor: OptionValue | null;
    room: OptionValue | null;
}

type ResultFilter = {
    id: string;
    code: string;
    placement_date: string;
    asset: Asset;
};

const IndexReportPage = ({ buildings }: IProps) => {
    const [isLoading, setIsLoading] = useState<boolean>(false);

    const [assets, setAssets] = useState<ResultFilter[] | []>([]);

    const onFilter = async (filter: FilterValues) => {
        const params = {
            building: filter.building.value,
            floor: filter.floor?.value,
            room: filter.room?.value,
        };

        setIsLoading(true);

        await axios
            .get("reports/filter", { params })
            .then((data) => {
                setAssets(data.data);
            })
            .catch((err) => {
                console.info(err);
            })
            .finally(() => {
                setIsLoading(false);
            });
    };

    return (
        <Authenticated>
            <Head title="Laporan" />
            <div className="w-full flex flex-row">
                <div className="md:w-1/4 w-full">
                    <FilterForm
                        onFilter={onFilter}
                        buildings={buildings}
                        isLoading={isLoading}
                    />
                </div>
                <div className="md:w-3/4 w-full md:pl-10">
                    <Card className="w-full">
                        <CardHeader>
                            <CardTitle>Hasil Filter</CardTitle>
                            <CardDescription>
                                Hasil filter anda akan muncul disini!
                            </CardDescription>
                        </CardHeader>
                        <CardContent>
                            <div className="w-full flex items-center justify-center">
                                {isLoading && (
                                    <RotateCw className="mr-2 h-4 w-4 animate-spin" />
                                )}
                            </div>
                            {assets.length > 0 && <Result datas={assets} />}
                        </CardContent>
                    </Card>
                </div>
            </div>
        </Authenticated>
    );
};

export default IndexReportPage;
