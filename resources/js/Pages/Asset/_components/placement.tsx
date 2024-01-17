import { Hint } from "@/Components/HInt";
import { Button } from "@/Components/ui/button";
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
import { ChevronRight, QrCode, XIcon } from "lucide-react";
import CreateForm from "./placement/create-form";
import { Asset, Placement } from "@/types/app";
import { DataEmpty } from "@/Components/DataEmpty";
import TableItem from "./placement/table-item";
import { Badge } from "@/Components/ui/badge";

interface PlacementProps {
    datas: Placement[];
    asset: Asset;
}

const PlacementPage = ({ datas, asset }: PlacementProps) => {
    const assetTotal = asset.quantity;
    const placementTotal = datas.length;

    return (
        <Card className="mb-10">
            <CardHeader>
                <div className="flex items-center justify-between">
                    <div>
                        <CardTitle>Penempatan</CardTitle>
                        <CardDescription className="mt-2">
                            List detail penempatan aset anda
                        </CardDescription>
                    </div>
                    <div>
                        {assetTotal === placementTotal ? (
                            <p className="text-sm text-muted-foreground">
                                Semua aset sudah ditempatkan
                            </p>
                        ) : (
                            <CreateForm />
                        )}
                    </div>
                </div>
            </CardHeader>
            <CardContent>
                <div className="mb-6">
                    <div className="flex gap-x-3">
                        <p>
                            Jumlah aset : <Badge>{assetTotal}</Badge>
                        </p>
                        <p>
                            Ditempatkan :{" "}
                            <Badge className="bg-green-700">
                                {placementTotal}
                            </Badge>
                        </p>
                    </div>
                </div>

                <Table className="border">
                    <TableHeader>
                        <TableRow>
                            <TableHead className="w-[80px]">No.</TableHead>
                            <TableHead>Tempat</TableHead>
                            <TableHead className="text-center">
                                Qrcode
                            </TableHead>
                            <TableHead>Aksi</TableHead>
                        </TableRow>
                    </TableHeader>
                    <TableBody>
                        {datas.length < 1 && (
                            <TableRow>
                                <TableCell colSpan={4}>
                                    <DataEmpty message="Belum ada penempatan" />
                                </TableCell>
                            </TableRow>
                        )}

                        {datas.length > 0 &&
                            datas.map((placement, index) => (
                                <TableItem
                                    placement={placement}
                                    key={index}
                                    index={index}
                                />
                            ))}
                    </TableBody>
                </Table>
            </CardContent>
        </Card>
    );
};

export default PlacementPage;
