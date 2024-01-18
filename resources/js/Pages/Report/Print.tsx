import { Button } from "@/Components/ui/button";
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from "@/Components/ui/dropdown-menu";
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/Components/ui/table";
import { formatRupiah } from "@/Helpers/currency";
import { formatDate } from "@/Helpers/date";
import { Asset } from "@/types/app";
import { SharedInertiaData } from "@/types/inertia";
import { Head, router, usePage } from "@inertiajs/react";
import { Printer } from "lucide-react";
import { QRCodeCanvas } from "qrcode.react";

interface IPros {
    placements: {
        id: string;
        code: string;
        placement_date: string;
        asset: Asset;
    }[];
    building_name: string;
    floor_name: string | null;
    room_name: string | null;
}

const PrintPage = ({
    placements,
    building_name,
    floor_name,
    room_name,
}: IPros) => {
    const { ziggy } = usePage<SharedInertiaData>().props;

    const handleBack = () => {
        return router.get(route("report.index"));
    };

    return (
        <div className="h-screen w-full">
            <Head title="cetak" />
            <div className="no-print w-full h-[78px] shadow-sm border-t fixed bg-white z-50 bottom-0">
                <div className="container mx-auto flex items-center h-full justify-center gap-x-4">
                    <Button variant="outline" onClick={handleBack}>
                        Kembali
                    </Button>
                    <DropdownMenu>
                        <DropdownMenuTrigger asChild>
                            <Button>
                                <Printer className="h-4 w-4 mr-2" />
                                Cetak sebagai
                            </Button>
                        </DropdownMenuTrigger>
                        <DropdownMenuContent>
                            <DropdownMenuItem
                                onClick={() => window.print()}
                                className="cursor-pointer"
                            >
                                HTML
                            </DropdownMenuItem>
                            <DropdownMenuItem className="cursor-pointer">
                                PDF
                            </DropdownMenuItem>
                        </DropdownMenuContent>
                    </DropdownMenu>
                </div>
            </div>

            <div className="container mx-auto pt-10">
                <div className="mb-5">
                    <ul>
                        <li>Gedung : {building_name}</li>
                        <li>Lantai : {floor_name ?? null}</li>
                        <li>Ruangan : {room_name ?? null}</li>
                    </ul>
                </div>
                <Table className="border">
                    <TableHeader>
                        <TableRow>
                            <TableHead className="w-[100px]">No.</TableHead>
                            <TableHead>Nama aset</TableHead>
                            <TableHead>Kode</TableHead>
                            <TableHead>Tanggal penempatan</TableHead>
                            <TableHead>Harga</TableHead>
                            <TableHead>Qrcode</TableHead>
                        </TableRow>
                    </TableHeader>
                    <TableBody>
                        {placements.map((item, index) => (
                            <TableRow key={index}>
                                <TableCell className="font-medium">
                                    {index + 1}
                                </TableCell>
                                <TableCell>
                                    <p className="font-bold">
                                        {item.asset.name}
                                    </p>
                                </TableCell>
                                <TableCell>{item.code}</TableCell>
                                <TableCell>
                                    {formatDate(item.placement_date)}
                                </TableCell>
                                <TableCell>
                                    {formatRupiah(item.asset.purchase_price)}
                                </TableCell>
                                <TableCell>
                                    <QRCodeCanvas
                                        size={50}
                                        value={`${ziggy?.url}/asset/${item.id}?_c=${item.code}`}
                                    />
                                </TableCell>
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </div>
        </div>
    );
};

export default PrintPage;
