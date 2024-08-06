import React, { useState, FormEvent } from "react";

interface FilterProps {
    buildings: { id: number; name: string }[];
    floors: { id: number; name: string }[];
    rooms: { id: number; name: string }[];
    onFilterChange: (
        buildingId: string,
        floorId: string,
        roomId: string
    ) => void;
}

export const Filter: React.FC<FilterProps> = ({
    buildings,
    floors,
    rooms,
    onFilterChange,
}) => {
    const [buildingId, setBuildingId] = useState<string>("");
    const [floorId, setFloorId] = useState<string>("");
    const [roomId, setRoomId] = useState<string>("");

    const handleFilterChange = () => {
        onFilterChange(buildingId, floorId, roomId);
    };

    return (
        <div className="w-1/4 p-6 bg-white rounded-lg shadow-md h-max sticky top-0">
            <h2 className="text-2xl font-semibold mb-4">Aset UMK</h2>
            {/* <div className="mb-4">
                <label
                    className="block text-gray-700 text-sm font-bold mb-2"
                    htmlFor="building"
                >
                    Building
                </label>
                <select
                    id="building"
                    className="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-2 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                    value={buildingId}
                    onChange={(e) => setBuildingId(e.target.value)}
                >
                    <option value="">All Buildings</option>
                    {buildings.map((building) => (
                        <option
                            key={building.id}
                            value={building.id.toString()}
                        >
                            {building.name}
                        </option>
                    ))}
                </select>
            </div>
            <div className="mb-4">
                <label
                    className="block text-gray-700 text-sm font-bold mb-2"
                    htmlFor="floor"
                >
                    Floor
                </label>
                <select
                    id="floor"
                    className="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-2 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                    value={floorId}
                    onChange={(e) => setFloorId(e.target.value)}
                >
                    <option value="">All Floors</option>
                    {floors.map((floor) => (
                        <option key={floor.id} value={floor.id.toString()}>
                            {floor.name}
                        </option>
                    ))}
                </select>
            </div>
            <div className="mb-4">
                <label
                    className="block text-gray-700 text-sm font-bold mb-2"
                    htmlFor="room"
                >
                    Room
                </label>
                <select
                    id="room"
                    className="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-2 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                    value={roomId}
                    onChange={(e) => setRoomId(e.target.value)}
                >
                    <option value="">All Rooms</option>
                    {rooms.map((room) => (
                        <option key={room.id} value={room.id.toString()}>
                            {room.name}
                        </option>
                    ))}
                </select>
            </div>
            <button
                onClick={handleFilterChange}
                className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
            >
                Apply Filters
            </button> */}
        </div>
    );
};
