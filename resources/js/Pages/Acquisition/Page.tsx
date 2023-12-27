import Authenticated from "@/Layouts/AuthenticatedLayout";
import {Head} from "@inertiajs/react";
import {Card, CardContent, CardDescription, CardHeader, CardTitle} from "@/Components/ui/card";
import CreateForm from "./_components/create-form";
import {Table, TableBody, TableCell, TableHead, TableHeader, TableRow} from "@/Components/ui/table";
import {TableItem} from "./_components/table-item";
import {DataEmpty} from "@/Components/DataEmpty";

interface IProps {
    acquisitions: {
        id: number;
        name: string;
    }[]
}

const AcquisitionPage = ({acquisitions}: IProps) => {

    const breadCrumb = [
        {
            title : "Kategori barang",
            url: "",
            disabled: true
        },
    ];

    return (
        <Authenticated breadCrumbs={breadCrumb}>
            <Head title="Kategori barang" />
            <Card>
                <div className="flex justify-between items-center">
                    <CardHeader>
                        <CardTitle>Kategori perolehan</CardTitle>
                        <CardDescription>List data kategori perolehan/acquisition barang</CardDescription>
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
                                acquisitions.length > 0 && (
                                    acquisitions.map((acquisition, index) => (
                                        <TableItem
                                            name={acquisition.name}
                                            key={index}
                                            index={index}
                                            id={acquisition.id}
                                        />
                                    ))
                                )
                            }

                            {
                                acquisitions.length < 1 && (
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

export default AcquisitionPage;
