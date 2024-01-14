import Modal from "@/Components/Modal";
import { Button } from "@/Components/ui/button";
import { usePlacementStore } from "@/Context/usePlacement";
import { PlusCircle } from "lucide-react";
import React, { useState } from "react";
import Select from "react-select";

const CreateForm = () => {
    const { buildings } = usePlacementStore();

    const [isLoading, setIsLoading] = useState<boolean>(false);
    const [isOpenModalAdd, setIsOpenModalAdd] = useState<boolean>(false);
    const [error, setError] = useState<string | null>(null);

    if (buildings === null) return;

    const toggleModalAdd = () => {
        setIsOpenModalAdd(!isOpenModalAdd);
        setError(null);
    };

    const handleSubmit = () => {
        //
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
                maxWidth="md"
            >
                <div className="py-4 px-6">
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
                            <Select options={buildings} autoFocus />
                        </div>
                        <div className="mb-5">
                            <label
                                htmlFor="password"
                                className="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                            >
                                Your password
                            </label>
                            <input
                                type="password"
                                id="password"
                                className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                required
                            />
                        </div>
                    </div>
                </div>
            </Modal>
        </div>
    );
};

export default CreateForm;
