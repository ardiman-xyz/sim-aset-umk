import axios from "axios";
import { useState } from "react";
import { Check, Pencil, RotateCw, XIcon } from "lucide-react";

import { formatRupiah } from "@/Helpers/currency";
import { formatDate } from "@/Helpers/date";

import { Input } from "@/Components/ui/input";
import { Button } from "@/Components/ui/button";
import { Hint } from "@/Components/HInt";
import { toast } from "sonner";
import { router } from "@inertiajs/react";

interface ItemProps {
    id: number;
    isEdited?: boolean;
    title: string;
    name: string;
    value: string | number;
    isCurrency?: boolean;
    isDate?: boolean;
    type?: "text" | "number" | "date";
}

const Item = ({
    id,
    title,
    value,
    name,
    isCurrency = false,
    isDate = false,
    type = "text",
    isEdited = true,
}: ItemProps) => {
    let displayedValue = value;
    if (isCurrency) {
        displayedValue = formatRupiah(value as number);
    } else if (isDate) {
        displayedValue = formatDate(value as string);
    }

    const [isEditing, setIsEditing] = useState<boolean>(false);

    const toggleEditing = () => setIsEditing(!isEditing);
    const [inputValue, setInputValue] = useState<string | number>(value);
    const [isLoading, setIsLoading] = useState<boolean>(false);

    const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
        setInputValue(event.target.value);
    };

    const isValueChange = value === inputValue;

    const handleSubmit = async () => {
        if (isValueChange) return;

        if (inputValue === "") return;

        setIsLoading(true);

        await axios
            .put(`/assets/item/${id}`, {
                value: inputValue,
                item: name,
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
                    <h5>{displayedValue}</h5>
                    {isEdited !== false && (
                        <div
                            onClick={toggleEditing}
                            className="hidden group-hover:flex items-center ml-2 cursor-pointer"
                        >
                            <Pencil className="w-4 h-4 " />
                        </div>
                    )}
                </div>
            )}
            {isEditing && (
                <div className="flex items-center">
                    <Input
                        onChange={handleChange}
                        value={inputValue}
                        className="w-max"
                        type={type}
                    />
                    <div>
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
                                disabled={isValueChange}
                                onClick={handleSubmit}
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

export default Item;
