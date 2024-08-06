import { Link, Head, usePage } from "@inertiajs/react";
import { useState } from "react";
import { Filter } from "./_components/filter";
import { Lists } from "./_components/lists";

interface ImageUrl {
    file: string;
    id: number;
}

interface Asset {
    id: string;
    name: string;
    description: string;
    gallery: ImageUrl[];
}

interface Building {
    id: number;
    name: string;
}

interface Floor {
    id: number;
    name: string;
}

interface Room {
    id: number;
    name: string;
}

interface PageProps {
    assets: Asset[];
    buildings: Building[];
    floors: Floor[];
    rooms: Room[];
}

export default function Welcome({
    assets,
    buildings,
    floors,
    rooms,
}: PageProps) {
    const [buildingId, setBuildingId] = useState<string>("");
    const [floorId, setFloorId] = useState<string>("");
    const [roomId, setRoomId] = useState<string>("");

    console.info(assets);

    const handleFilterChange = (e: any) => {
        //
    };

    return (
        <>
            <Head title="Welcome" />
            <main className="w-full min-h-screen bg-gray-100">
                <div className="container mx-auto max-w-screen-2xl flex py-8">
                    <Filter
                        buildings={buildings}
                        floors={floors}
                        rooms={rooms}
                        onFilterChange={handleFilterChange}
                    />
                    <Lists assets={assets} />
                </div>
            </main>
        </>
    );
}
