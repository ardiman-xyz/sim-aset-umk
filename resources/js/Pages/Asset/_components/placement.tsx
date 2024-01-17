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
import { Placement } from "@/types/app";
import { DataEmpty } from "@/Components/DataEmpty";
import TableItem from "./placement/table-item";

interface PlacementProps {
    datas: Placement[];
}

const PlacementPage = ({ datas }: PlacementProps) => {
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
                        <CreateForm />
                    </div>
                </div>
            </CardHeader>
            <CardContent>
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
