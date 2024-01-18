import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/Components/ui/table";
import { formatDate } from "@/Helpers/date";
import { Asset } from "@/types/app";

interface ResultProps {
    datas: {
        id: string;
        code: string;
        placement_date: string;
        asset: Asset;
    }[];
}

const Result = ({ datas }: ResultProps) => {
    return (
        <div>
            <Table className="border">
                <TableHeader>
                    <TableRow>
                        <TableHead className="w-[100px]">No.</TableHead>
                        <TableHead>Nama aset</TableHead>
                        <TableHead>Kode</TableHead>
                        <TableHead>Tanggal penempatan</TableHead>
                    </TableRow>
                </TableHeader>
                <TableBody>
                    {datas.map((item, index) => (
                        <TableRow key={index}>
                            <TableCell className="font-medium">
                                {index + 1}
                            </TableCell>
                            <TableCell>
                                <p className="font-bold">{item.asset.name}</p>
                            </TableCell>
                            <TableCell>{item.code}</TableCell>
                            <TableCell>
                                {formatDate(item.placement_date)}
                            </TableCell>
                        </TableRow>
                    ))}
                </TableBody>
            </Table>
        </div>
    );
};

export default Result;
