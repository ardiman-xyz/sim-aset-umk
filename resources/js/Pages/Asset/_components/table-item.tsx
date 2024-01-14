import {TableCell, TableRow} from "@/Components/ui/table";
import {Hint} from "@/Components/HInt";
import {
    DropdownMenu,
    DropdownMenuContent, DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger
} from "@/Components/ui/dropdown-menu";
import {MoreVertical} from "lucide-react";
import {Asset} from "@/types/app";
import {useState} from "react";
import {router} from "@inertiajs/react";

interface IProps {
    asset: Asset;
    index: number;
}

const TableItem = ({asset, index}: IProps) => {

    const [isModalEditOpen, setIsModalEditOpen] = useState<boolean>(false);
    const [isModalDeleteOpen, setIsModalDeleteOpen] = useState<boolean>(false);

    const handleClickDetail = () => {
        return router.visit(route("asset.show", asset.id))
    }

    return (
        <>
            <TableRow>
                <TableCell className="font-medium">{index + 1}</TableCell>
                <TableCell>
                    <Hint description="Klik untuk detail">
                        <span className="underline text-blue-700 cursor-pointer hover:text-blue-600 font-semibold" onClick={handleClickDetail}>
                            {asset.name}
                        </span>
                    </Hint>
                </TableCell>
                <TableCell>{asset.quantity}</TableCell>
                <TableCell>3 Barang</TableCell>
                <TableCell>
                    <DropdownMenu>
                        <DropdownMenuTrigger>
                            <MoreVertical className="w-4 h-4" />
                        </DropdownMenuTrigger>
                        <DropdownMenuContent>
                            <DropdownMenuLabel>Aksi</DropdownMenuLabel>
                            <DropdownMenuSeparator />
                            <DropdownMenuItem className="cursor-pointer" onClick={() => setIsModalEditOpen(true)}>Edit</DropdownMenuItem>
                            <DropdownMenuItem className="cursor-pointer" onClick={() => setIsModalDeleteOpen(true)}>
                                Delete
                            </DropdownMenuItem>
                        </DropdownMenuContent>
                    </DropdownMenu>
                </TableCell>
            </TableRow>

            {/*{*/}
            {/*    isModalEditOpen && (*/}
            {/*        <EditForm*/}
            {/*            defaultData={*/}
            {/*                {*/}
            {/*                    name,*/}
            {/*                    id*/}
            {/*                }*/}
            {/*            }*/}
            {/*            isOpen={isModalEditOpen}*/}
            {/*            onClose={() => setIsModalEditOpen(false)}*/}
            {/*        />*/}
            {/*    )*/}
            {/*}*/}

            {/*{*/}
            {/*    isModalDeleteOpen && (*/}
            {/*        <DeleteConfirm*/}
            {/*            id={id}*/}
            {/*            name={name}*/}
            {/*            onClose={() => setIsModalDeleteOpen(false)}*/}
            {/*        />*/}
            {/*    )*/}
            {/*}*/}
        </>
    )
}

export default TableItem;
