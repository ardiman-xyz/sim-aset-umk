import { PlusCircle } from "lucide-react";
import { Head, router } from "@inertiajs/react";

import Authenticated from "@/Layouts/AuthenticatedLayout";
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/Components/ui/card";
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/Components/ui/table";
import { Button } from "@/Components/ui/button";
import { Asset } from "@/types/app";
import TableItem from "./_components/table-item";
import { DataEmpty } from "@/Components/DataEmpty";

interface IProps {
    assets: Asset[];
}

const AssetPage = ({ assets }: IProps) => {
    const breadCrumb = [
        {
            title: "Aset",
            url: "",
            disabled: true,
        },
    ];

    return (
        <Authenticated breadCrumbs={breadCrumb}>
            <Head title="Aset" />
            <Card>
                <div className="flex justify-between items-center">
                    <CardHeader>
                        <CardTitle>Aset</CardTitle>
                        <CardDescription>List data aset</CardDescription>
                    </CardHeader>
                    <div className="mr-6">
                        <Button
                            onClick={() => router.visit(route("asset.create"))}
                        >
                            <PlusCircle className="w-4 h-4 mr-2" />
                            Tambah
                        </Button>
                    </div>
                </div>
                <CardContent>
                    <Table className="border">
                        <TableHeader>
                            <TableRow>
                                <TableHead className="w-[100px]">No.</TableHead>
                                <TableHead>Nama Barang</TableHead>
                                <TableHead>J. Barang</TableHead>
                                <TableHead>Ditempatkan</TableHead>
                                <TableHead>Aksi</TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {assets.length > 0 &&
                                assets.map((asset, index) => (
                                    <TableItem asset={asset} index={index} />
                                ))}

                            {assets.length < 1 && (
                                <TableRow>
                                    <TableCell colSpan={5}>
                                        <DataEmpty />
                                    </TableCell>
                                </TableRow>
                            )}
                        </TableBody>
                    </Table>
                </CardContent>
            </Card>
        </Authenticated>
    );
};

export default AssetPage;
