import Select from "react-select";

import { Button } from "@/Components/ui/button";
import {
    Card,
    CardContent,
    CardDescription,
    CardFooter,
    CardHeader,
    CardTitle,
} from "@/Components/ui/card";
import { useState } from "react";
import axios from "axios";

interface OptionValue {
    value: number;
    label: string;
}

interface FilterValues {
    building: OptionValue;
    floor: OptionValue | null;
    room: OptionValue | null;
}

interface IProps {
    buildings: {
        value: number;
        label: string;
    }[];

    onFilter: (filter: FilterValues) => void;
    isLoading: boolean;
}

const FilterForm = ({ buildings, onFilter, isLoading }: IProps) => {
    const [floors, setFloors] = useState<OptionValue[] | []>([]);
    const [rooms, setRooms] = useState<OptionValue[] | []>([]);

    const [selectedBuilding, setSelectedBuilding] =
        useState<null | OptionValue>(null);
    const [selectedFloor, setSelectedFloor] = useState<null | OptionValue>(
        null
    );
    const [selectedRoom, setSelectedRoom] = useState<null | OptionValue>(null);
    const [selectedDate, setSelectedDate] = useState<null | string>(null);

    const handleChangeBuilding = async (
        newValue: OptionValue | null,
        actionMeta: any
    ) => {
        if (newValue) {
            const id = newValue.value;
            setSelectedBuilding(newValue);
            setSelectedFloor(null);
            setSelectedRoom(null);

            await axios.get(`/assets/${id}/floors`).then(({ data }) => {
                setFloors(data.data);
            });
        }
    };

    const handleChangeFloor = async (
        newValue: OptionValue | null,
        actionMeta: any
    ) => {
        if (newValue) {
            const id = newValue.value;
            setSelectedFloor(newValue);
            setSelectedRoom(null);

            await axios.get(`/assets/${id}/rooms`).then(({ data }) => {
                setRooms(data.data);
            });
        }
    };

    const handleChangeRoom = async (
        newValue: OptionValue | null,
        actionMeta: any
    ) => {
        if (newValue) {
            setSelectedRoom(newValue);
        }
    };

    const handleFilter = () => {
        if (selectedBuilding === null) return;

        const filter: FilterValues = {
            building: selectedBuilding,
            floor: selectedFloor,
            room: selectedRoom,
        };

        onFilter(filter);
    };

    return (
        <Card className="w-full">
            <CardHeader>
                <CardTitle>Filter</CardTitle>
                <CardDescription>
                    Filter data keberadaan aset anda.
                </CardDescription>
            </CardHeader>
            <CardContent>
                <div>
                    <div className="mb-5">
                        <label
                            htmlFor="email"
                            className="block mb-2 text-sm font-medium text-gray-700 dark:text-white"
                        >
                            Gedung
                        </label>
                        <Select
                            options={buildings}
                            autoFocus
                            onChange={handleChangeBuilding}
                            value={selectedBuilding}
                        />
                    </div>
                    <div className="mb-5">
                        <label
                            htmlFor="email"
                            className="block mb-2 text-sm font-medium text-gray-700 dark:text-white"
                        >
                            Lantai
                        </label>
                        <Select
                            options={floors}
                            autoFocus
                            onChange={handleChangeFloor}
                            isClearable
                            value={selectedFloor}
                        />
                    </div>
                    <div className="mb-5">
                        <label
                            htmlFor="email"
                            className="block mb-2 text-sm font-medium text-gray-700 dark:text-white"
                        >
                            Ruangan
                        </label>
                        <Select
                            options={rooms}
                            autoFocus
                            onChange={handleChangeRoom}
                            isClearable
                            value={selectedRoom}
                        />
                    </div>
                </div>
            </CardContent>
            <CardFooter>
                <div className="flex flex-row gap-x-2 w-full">
                    <Button variant="outline" className="w-full">
                        Reset
                    </Button>
                    <Button
                        disabled={selectedBuilding === null || isLoading}
                        className="w-full"
                        onClick={handleFilter}
                    >
                        Filter
                    </Button>
                </div>
            </CardFooter>
        </Card>
    );
};

export default FilterForm;
