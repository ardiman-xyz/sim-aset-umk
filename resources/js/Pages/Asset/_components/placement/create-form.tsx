import Select from "react-select";
import { PlusCircle, RotateCw } from "lucide-react";
import { useState } from "react";
import { toast } from "sonner";
import { router } from "@inertiajs/react";
import axios from "axios";

import Modal from "@/Components/Modal";
import { Button } from "@/Components/ui/button";
import { usePlacementStore } from "@/Context/usePlacement";
import { Input } from "@/Components/ui/input";
import { useAssetStore } from "@/Context/useDetailAsetStore";

interface OptionValue {
    value: number;
    label: string;
}

const CreateForm = () => {
    const { buildings } = usePlacementStore();
    const { asset } = useAssetStore();

    const [isLoading, setIsLoading] = useState<boolean>(false);
    const [isOpenModalAdd, setIsOpenModalAdd] = useState<boolean>(false);
    const [error, setError] = useState<string | null>(null);

    const [floors, setFloors] = useState<OptionValue[] | []>([]);
    const [rooms, setRooms] = useState<OptionValue[] | []>([]);

    const [selectedBuilding, setSelectedBuilding] =
        useState<null | OptionValue>(null);
    const [selectedFloor, setSelectedFloor] = useState<null | OptionValue>(
        null
    );
    const [selectedRoom, setSelectedRoom] = useState<null | OptionValue>(null);
    const [selectedDate, setSelectedDate] = useState<null | string>(null);

    if (buildings === null) return;

    const toggleModalAdd = () => {
        setIsOpenModalAdd(!isOpenModalAdd);
        setError(null);
    };

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

    const isValidForm =
        selectedBuilding !== null &&
        selectedFloor !== null &&
        selectedRoom !== null &&
        selectedDate !== null;

    const handleSubmit = async () => {
        if (!isValidForm) return;

        setIsLoading(true);

        await axios
            .post("/assets/placement/" + asset?.id, {
                buildingId: selectedBuilding.value,
                floorId: selectedFloor.value,
                roomId: selectedRoom.value,
                datePlacement: selectedDate,
            })
            .then((res) => {
                const { message, data } = res.data;
                toast.success(`${message}`);
                router.reload();
                toggleModalAdd();
                setSelectedBuilding(null);
                setSelectedFloor(null);
                setSelectedRoom(null);
                setSelectedDate(null);
            })
            .catch((err) => {
                const { data, status, statusText } = err.response;
                toast.error(`${statusText} ${status}`, {
                    description: `${data.message}`,
                });
            })
            .finally(() => {
                setIsLoading(false);
            });
    };

    return (
        <div>
            <Button onClick={toggleModalAdd}>
                <PlusCircle className="w-4 h-4 mr-2" />
                Tambah
            </Button>
            <Modal
                onClose={toggleModalAdd}
                show={isOpenModalAdd}
                closeable={!isLoading}
                maxWidth="lg"
            >
                <div className="py-4 px-6 h-[500px] relative">
                    <div className="w-full flex items-center justify-center">
                        <h2 className="text-md text-center font-bold">
                            Buat penempatan aset
                        </h2>
                    </div>
                    <div className="mt-4">
                        <div className="mb-5">
                            <label
                                htmlFor="email"
                                className="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
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
                                htmlFor="password"
                                className="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
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
                                htmlFor="password"
                                className="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
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
                        <div className="mb-5">
                            <label
                                htmlFor="password"
                                className="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                            >
                                Tanggal penempatan
                            </label>
                            <Input
                                type="date"
                                onChange={(e) =>
                                    setSelectedDate(e.target.value)
                                }
                            />
                        </div>
                    </div>
                    <div className="w-full flex space-x-2 absolute bottom-0 left-0 px-8 bg-gray-100 py-4 border-t">
                        <Button
                            onClick={toggleModalAdd}
                            className="w-full"
                            variant="outline"
                        >
                            Batal
                        </Button>
                        <Button
                            onClick={handleSubmit}
                            disabled={isLoading || !isValidForm}
                            className="w-full"
                        >
                            {isLoading && (
                                <RotateCw className="h-4 w-4 animate-spin" />
                            )}
                            Simpan
                        </Button>
                    </div>
                </div>
            </Modal>
        </div>
    );
};

export default CreateForm;
