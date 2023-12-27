import {TableCell, TableRow} from "@/Components/ui/table";
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
import DeleteConfirm from "./delete-confirm";

interface IProps {
    name: string;
    id: number;
    index: number;
}

export const TableItem = ({name, index, id}: IProps) => {

    const [isModalEditOpen, setIsModalEditOpen] = useState<boolean>(false);
    const [isModalDeleteOpen, setIsModalDeleteOpen] = useState<boolean>(false);

    return (
        <>
            <TableRow>
                <TableCell className="font-medium">{index + 1}</TableCell>
                <TableCell>
                    <span className="font-semibold">
                        {name}
                    </span>
                </TableCell>
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
