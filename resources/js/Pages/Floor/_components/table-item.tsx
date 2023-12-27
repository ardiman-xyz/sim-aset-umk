import {TableCell, TableRow} from "@/Components/ui/table";
import {router} from "@inertiajs/react";
import {MoreVertical} from "lucide-react";

import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from "@/Components/ui/dropdown-menu";
import {useState} from "react";
import EditForm from "./edit-form";
import {DeleteConfirm} from "./delete-confirm";
import {Hint} from "@/Components/HInt";

interface IProps {
    name: string;
    id: number;
    index: number;
    buildingId: number;
}

export const TableItem = ({name, index, id, buildingId}: IProps) => {

    const [isModalEditOpen, setIsModalEditOpen] = useState<boolean>(false);
    const [isModalDeleteOpen, setIsModalDeleteOpen] = useState<boolean>(false);

    const handleClickDetail = () => {
        return router.visit(route("floor.index", id))
    }

    return (
        <>
            <TableRow>
                <TableCell className="font-medium">{index + 1}</TableCell>
                <TableCell>
                    <Hint description="Klik untuk detail">
                        <span className="underline text-blue-700 cursor-pointer hover:text-blue-600 font-semibold" onClick={handleClickDetail}>
                            {name}
                        </span>
                    </Hint>
                </TableCell>
                <TableCell>5</TableCell>
                <TableCell>30</TableCell>
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

            {
                isModalEditOpen && (
                    <EditForm
                        defaultData={
                            {
                                name,
                                id
                            }
                        }
                        buildingId={buildingId}
                        isOpen={isModalEditOpen}
                        onClose={() => setIsModalEditOpen(false)}
                    />
                )
            }

            {
                isModalDeleteOpen && (
                    <DeleteConfirm
                        id={id}
                        name={name}
                        onClose={() => setIsModalDeleteOpen(false)}
                    />
                )
            }
        </>
    )
}
