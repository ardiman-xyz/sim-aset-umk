import { useState } from "react";
import axios from "axios";
import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import * as z from "zod";

import Modal from "@/Components/Modal";
import { Button } from "@/Components/ui/button";
import { Input } from "@/Components/ui/input";
import {
    Form,
    FormControl,
    FormField,
    FormItem,
    FormMessage,
} from "@/Components/ui/form";
import { Alert, AlertDescription, AlertTitle } from "@/Components/ui/alert";
import {AlertCircle, PlusCircle, RotateCw} from "lucide-react";
import { toast } from "sonner";
import { router } from "@inertiajs/react";

const formSchema = z.object({
    name: z.string().min(2, {
        message: "Nama gedung harus di isi!",
    }),
});

interface IProps {
    defaultData: {
        name: string;
        id: number;
    };
    isOpen: boolean;
    onClose: () => void;
}

const EditForm = ({defaultData, isOpen, onClose}: IProps) => {
    const [isLoading, setIsLoading] = useState<boolean>(false);
    const [error, setError] = useState<string | null>(null);

    const form = useForm<z.infer<typeof formSchema>>({
        resolver: zodResolver(formSchema),
        defaultValues: {
            name: defaultData.name,
        },
    });

    async function onSubmit(values: z.infer<typeof formSchema>) {
        setError(null);
        setIsLoading(true);
        await axios
            .put(`/categories/`+defaultData.id, values)
            .then((data) => {
                const { message } = data.data;
                toast.success(`${message}`);
                onClose();
                form.reset();
                router.reload();
            })
            .catch((err) => {
                const { data} = err.response;
                setError(data.message);
            })
            .finally(() => {
                setIsLoading(false);
            });
    }

    return (
        <div>
            <Modal
                onClose={onClose}
                show={isOpen}
                closeable={!isLoading}
                maxWidth="md"
            >
                <div className="p-4">
                    <div className="w-full flex items-center justify-center">
                        <h2 className="text-md text-center font-bold">
                            Tambah gedung
                        </h2>
                    </div>
                    <div className="mt-4">
                        {error !== null && (
                            <Alert className="mb-5 bg-red-100 border border-red-600">
                                <AlertCircle className="h-4 w-4 " />
                                <AlertTitle>Error!</AlertTitle>
                                <AlertDescription>{error}</AlertDescription>
                            </Alert>
                        )}

                        <Form {...form}>
                            <form
                                onSubmit={form.handleSubmit(onSubmit)}
                                className="space-y-8"
                            >
                                <FormField
                                    control={form.control}
                                    name="name"
                                    render={({ field }) => (
                                        <FormItem>
                                            <FormControl>
                                                <Input
                                                    placeholder="Masukkan nama gedung..."
                                                    {...field}
                                                    disabled={isLoading}
                                                />
                                            </FormControl>

                                            <FormMessage />
                                        </FormItem>
                                    )}
                                />
                                <Button
                                    type="submit"
                                    className="w-full"
                                    disabled={isLoading}
                                >
                                    {isLoading && (
                                        <RotateCw className="mr-2 h-4 w-4 animate-spin" />
                                    )}
                                    Simpan
                                </Button>
                            </form>
                        </Form>
                    </div>
                </div>
            </Modal>
        </div>
    );
};

export default EditForm;
