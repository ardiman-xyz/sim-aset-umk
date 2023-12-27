import Authenticated from "@/Layouts/AuthenticatedLayout";
import {Head} from "@inertiajs/react";
import {Card, CardContent, CardDescription, CardHeader, CardTitle} from "@/Components/ui/card";
import CreateForm from "./_components/create-form";
import {Table, TableBody, TableCell, TableHead, TableHeader, TableRow} from "@/Components/ui/table";
import {TableItem} from "./_components/table-item";
import {DataEmpty} from "@/Components/DataEmpty";

interface IProps {
    conditions: {
        id: number;
        name: string;
    }[]
}

const ConditionPage = ({conditions}: IProps) => {

    const breadCrumb = [
        {
            title : "Kondisi barang",
            url: "",
            disabled: true
        },
    ];

    return (
        <Authenticated breadCrumbs={breadCrumb}>
            <Head title="Kategori kondisi barang" />
            <Card>
                <div className="flex justify-between items-center">
                    <CardHeader>
                        <CardTitle>Kategori Kondisi barang</CardTitle>
                        <CardDescription>List data kategori kondisi barang</CardDescription>
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
                                <TableHead >Aksi</TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {
                                conditions.length > 0 && (
                                    conditions.map((condition, index) => (
                                        <TableItem
                                            name={condition.name}
                                            key={index}
                                            index={index}
                                            id={condition.id}
                                        />
                                    ))
                                )
                            }

                            {
                                conditions.length < 1 && (
                                    <TableRow >
                                        <TableCell colSpan={4}>
                                            <DataEmpty />
                                        </TableCell>
                                    </TableRow>
                                )
                            }
                        </TableBody>
                    </Table>

                </CardContent>
            </Card>
        </Authenticated>
    )
}

export default ConditionPage;
