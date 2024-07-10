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
    TableHead,
    TableHeader,
    TableRow,
} from "@/Components/ui/table";
import Authenticated from "@/Layouts/AuthenticatedLayout";
import { Head } from "@inertiajs/react";
import { CreateForm } from "./_components/CreateForm";
import { User } from "@/types/app";
import { DataTable } from "./_components/DataTable";
import { columns } from "./_components/column";

interface IndexProps {
    users: User[];
}

const Index = ({ users }: IndexProps) => {
    return (
        <Authenticated>
            <Head title="Pengaturan user" />
            <Card>
                <div className="flex justify-between items-center">
                    <CardHeader>
                        <CardTitle>Pengguna</CardTitle>
                        <CardDescription>
                            Atur role pengguna untuk penggunaan sistem.
                        </CardDescription>
                    </CardHeader>
                    <div className="mr-6">
                        <CreateForm />
                    </div>
                </div>
                <CardContent>
                    <DataTable columns={columns} data={users} />
                </CardContent>
            </Card>
        </Authenticated>
    );
};

export default Index;
