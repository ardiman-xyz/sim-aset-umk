import { Hint } from "@/Components/HInt";
import { Button } from "@/Components/ui/button";
import { router } from "@inertiajs/react";
import axios from "axios";
import { Check, Pencil, RotateCw, XIcon } from "lucide-react";
import { useState } from "react";
import { toast } from "sonner";

interface CategoriesProps {
    title: string;
    id: number;
    data: { id: number; name: string };
    categories: {
        id: number;
        name: string;
    }[];
}

const Categories = ({ title, categories, data, id }: CategoriesProps) => {
    const [isEditing, setIsEditing] = useState<boolean>(false);
    const [isLoading, setIsLoading] = useState<boolean>(false);
    const [selectedCategory, setSelectedCategory] = useState<string | number>(
        data.id
    );

    const toggleEditing = () => setIsEditing(!isEditing);

    const handleSelectChange = (
        event: React.ChangeEvent<HTMLSelectElement>
    ) => {
        setSelectedCategory(event.target.value);
    };

    const handleSubmit = async () => {
        setIsLoading(true);

        await axios
            .put(`/assets/categories/${id}`, {
                value: selectedCategory,
            })
            .then((data) => {
                const { message } = data.data;
                toast.success(`${message}`);
                router.reload();
                toggleEditing();
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
        <div className="group">
            <span className="text-sm font-semibold text-gray-400">{title}</span>
            {!isEditing && (
                <div className="flex ">
                    <h5>{data.name}</h5>
                    <div
                        onClick={toggleEditing}
                        className="hidden group-hover:flex items-center ml-2 cursor-pointer"
                    >
                        <Pencil className="w-4 h-4 " />
                    </div>
                </div>
            )}

            {isEditing && (
                <div className="flex ">
                    <select
                        id="countries"
                        className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                        onChange={handleSelectChange}
                    >
                        {categories.map((item, index) => (
                            <option
                                key={index}
                                selected={item.id === selectedCategory}
                                value={item.id}
                            >
                                {item.name}
                            </option>
                        ))}
                    </select>
                    <div className="flex">
                        <Hint description="Batalkan">
                            <Button
                                onClick={toggleEditing}
                                className="ml-1"
                                size="sm"
                                variant="outline"
                            >
                                <XIcon className="w-4 h-4" />
                            </Button>
                        </Hint>
                        <Hint description="simpan">
                            <Button
                                onClick={handleSubmit}
                                disabled={isLoading}
                                className="ml-1"
                                size="sm"
                            >
                                {isLoading ? (
                                    <RotateCw className="h-4 w-4 animate-spin" />
                                ) : (
                                    <Check className="w-4 h-4" />
                                )}
                            </Button>
                        </Hint>
                    </div>
                </div>
            )}
        </div>
    );
};

export default Categories;
