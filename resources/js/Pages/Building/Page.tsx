import {Head} from "@inertiajs/react";

import Authenticated from "@/Layouts/AuthenticatedLayout";

import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/Components/ui/card"

import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/Components/ui/table"
import CreateForm from "./_components/create-form";
import {TableItem} from "@/Pages/Building/_components/TableItem";



const breadCrumb = [
    {
        title : "Gedung",
        url: "building.index",
        disabled: true
    },
];

interface IProps {
    buildings: {
        name: string
        id: number;
    }[]
}

const Page = ({buildings}: IProps) => {

    return (
        <Authenticated breadCrumbs={breadCrumb}>
            <Head title="Gedung" />
            <Card>
                <div className="flex justify-between items-center">
                    <CardHeader>
                        <CardTitle>Gedung</CardTitle>
                        <CardDescription>List data gedung</CardDescription>
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
                                <TableHead>Jumlah lantai</TableHead>
                                <TableHead>Jumlah kelas</TableHead>
                                <TableHead >Aksi</TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {
                                buildings.length > 0 && (
                                    buildings.map((building, index) => (
                                        <TableItem
                                            name={building.name}
                                            key={index}
                                            index={index}
                                            id={building.id}
                                        />
                                    ))
                                )
                            }
                        </TableBody>
                    </Table>

                </CardContent>
            </Card>

        </Authenticated>
    )
}

export default Page;
