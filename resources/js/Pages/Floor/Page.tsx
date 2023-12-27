import Authenticated from "@/Layouts/AuthenticatedLayout";
import {Head} from "@inertiajs/react";
import {Building} from "@/types/app";
import CreateForm from "./_components/create-form";

import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/Components/ui/card";
import {
    Table,
    TableBody, TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/Components/ui/table"
import {TableItem} from "./_components/table-item";
import {DataEmpty} from "@/Components/DataEmpty";


interface IProps {
    building: Building
}

const Page = ({building}: IProps) => {

    const breadCrumb = [
        {
            title : "Gedung",
            url: "building.index",
            disabled: false
        },
        {
            title : building.name,
            url: "",
            disabled: true
        },
    ];

    return (
        <Authenticated breadCrumbs={breadCrumb}>
            <Head title={`Lantai ${building.name}`} />
            <Card>
                <div className="flex justify-between items-center">
                    <CardHeader>
                        <CardTitle>Lantai</CardTitle>
                        <CardDescription>Lantai di {building.name}</CardDescription>
                    </CardHeader>
                    <div className="mr-6">
                        <CreateForm
                            buildingId={building.id}
                        />
                    </div>
                </div>
                <CardContent>
                    <Table className="border">
                        <TableHeader>
                            <TableRow>
                                <TableHead className="w-[100px]">No.</TableHead>
                                <TableHead>Nama</TableHead>
                                <TableHead>Jumlah ruangan</TableHead>
                                <TableHead >Aksi</TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {
                                building.floors.length > 0 && (
                                    building.floors.map((floor, index) => (
                                        <TableItem
                                            name={floor.name}
                                            key={index}
                                            index={index}
                                            id={floor.id}
                                            buildingId={building.id}
                                        />
                                    ))
                                )
                            }
                            {
                                building.floors.length < 1 && (
                                    <TableRow >
                                        <TableCell colSpan={5}>
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

export default Page;
