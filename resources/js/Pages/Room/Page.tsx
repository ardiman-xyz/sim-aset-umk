import Authenticated from "@/Layouts/AuthenticatedLayout";
import {Head} from "@inertiajs/react";

import {Card, CardContent, CardDescription, CardHeader, CardTitle} from "@/Components/ui/card";
import { Room} from "@/types/app";
import {Table, TableBody, TableCell, TableHead, TableHeader, TableRow} from "@/Components/ui/table";

import CreateForm from "./_components/create-form";
import {DataEmpty} from "@/Components/DataEmpty";
import {TableItem} from "./_components/table-item";

interface RoomProps {
    data : {
        building: {
            id: number;
            name: string;
        };
        id: number;
        name: string;
        rooms: Room[]
    }
}

const RoomPage = ({data}: RoomProps) => {

    const breadCrumb = [
        {
            title : "Gedung",
            url: "building.index",
            disabled: false
        },
        {
            title : data.building.name,
            url: "floor.index",
            params: {
                building_id: data.building.id,
            },
            disabled: false
        },
        {
            title : data.name,
            url: "",
            disabled: true
        },
    ];

    return (
        <Authenticated breadCrumbs={breadCrumb}>
            <Head title={`Ruangan di ` + data.name} />
            <Card>
                <div className="flex justify-between items-center">
                    <CardHeader>
                        <CardTitle>Ruangan</CardTitle>
                        <CardDescription>Ruangan di {data.name}</CardDescription>
                    </CardHeader>
                    <div className="mr-6">
                        <CreateForm
                            floorId={data.id}
                        />
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
                                data.rooms.length > 0 && (
                                    data.rooms.map((room, index) => (
                                        <TableItem
                                            name={room.name}
                                            key={index}
                                            index={index}
                                            id={room.id}
                                            floorId={data.id}
                                        />
                                    ))
                                )
                            }
                            {
                                data.rooms.length < 1 && (
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

export default RoomPage;
