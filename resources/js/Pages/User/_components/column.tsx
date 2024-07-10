import { Badge } from "@/Components/ui/badge";
import { User } from "@/types/app";
import { ColumnDef } from "@tanstack/react-table";

import { ClipboardEdit, Link2, MoreHorizontal, Trash2 } from "lucide-react";

import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from "@/Components/ui/dropdown-menu";
import { useState } from "react";
import { Button } from "@/Components/ui/button";
import { EditModal } from "./EditModal";

export const columns: ColumnDef<User>[] = [
    {
        id: "id",
        header: "No",
        cell: ({ row }) => {
            return <div>{Number(row.id) + 1}</div>;
        },
    },
    {
        id: "name",
        header: "Nama",
        cell: ({ row }) => {
            return (
                <div className="capitalize font-bold">{row.original.name}</div>
            );
        },
    },
    {
        accessorKey: "email",
        header: "Email",
    },
    {
        id: "role",
        header: "Role",
        cell: ({ row }) => {
            const role = row.original.roles[0].name;

            const bgColor = role === "Admin" ? "bg-red-700" : "bg-sky-700";

            return (
                <div>
                    <Badge
                        variant="outline"
                        className={`${bgColor} rounded-md text-white`}
                    >
                        {role}
                    </Badge>
                </div>
            );
        },
    },
    {
        id: "action",
        header: "Aksi",
        cell: ({ row }) => {
            return <ActionMenu data={row.original} />;
        },
    },
];

const ActionMenu = ({ data }: { data: User }) => {
    const [isModalEditOpen, setIsModalEditOpen] = useState<boolean>(false);
    const [isModalDeleteOpen, setIsModalDeleteOpen] = useState<boolean>(false);

    const role = data.roles[0].name;

    if (role === "Admin") return null;

    return (
        <div>
            <DropdownMenu>
                <DropdownMenuTrigger asChild>
                    <Button variant="ghost" className="h-8 w-8 p-0">
                        <span className="sr-only">Open menu</span>
                        <MoreHorizontal className="h-4 w-4" />
                    </Button>
                </DropdownMenuTrigger>
                <DropdownMenuContent align="end">
                    <DropdownMenuItem
                        className="cursor-pointer"
                        onClick={() => setIsModalEditOpen(true)}
                    >
                        <ClipboardEdit className="h-4 w-4 mr-2" />
                        Edit
                    </DropdownMenuItem>
                    <DropdownMenuSeparator />
                    <DropdownMenuItem
                        className="cursor-pointer"
                        onClick={() => setIsModalDeleteOpen(true)}
                    >
                        <Trash2 className="h-4 w-4 mr-2" />
                        Delete
                    </DropdownMenuItem>
                </DropdownMenuContent>
            </DropdownMenu>

            {isModalEditOpen && (
                <EditModal
                    user={data}
                    onClose={() => setIsModalEditOpen(false)}
                />
            )}
            {/* {
                isModalDeleteOpen && (
                    <DeleteConfirm user={data} onClose={() => setIsModalDeleteOpen(false)}  />
                )
            } */}
        </div>
    );
};
