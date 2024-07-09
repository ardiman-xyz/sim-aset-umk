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

const Index = () => {
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
                    <Table className="border">
                        <TableHeader>
                            <TableRow>
                                <TableHead className="w-[100px]">No.</TableHead>
                                <TableHead>Nama</TableHead>
                                <TableHead>Aksi</TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody></TableBody>
                    </Table>
                </CardContent>
            </Card>
        </Authenticated>
    );
};

export default Index;
