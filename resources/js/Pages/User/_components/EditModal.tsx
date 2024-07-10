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
    FormLabel,
    FormMessage,
} from "@/Components/ui/form";
import { Alert, AlertDescription, AlertTitle } from "@/Components/ui/alert";
import { AlertCircle, PlusCircle, RotateCw } from "lucide-react";
import { toast } from "sonner";
import { router } from "@inertiajs/react";
import Checkbox from "@/Components/Checkbox";
import { FormError } from "@/Components/FormError";
import { User } from "@/types/app";

const formSchema = z
    .object({
        name: z.string().min(2, {
            message: "Input harus di isi!",
        }),
        email: z
            .string()
            .min(2, {
                message: "Input harus di isi!",
            })
            .email({
                message: "Email tidak valid!",
            }),
        password: z.string().optional(),
        confirm_password: z.string().optional(),
    })
    .refine((data) => data.password === data.confirm_password, {
        message: "Konfirmasi kata sandi tidak cocok dengan kata sandi baru",
        path: ["confirm_password"],
    });

interface EditModalProps {
    user: User;
    onClose: () => void;
}

export const EditModal = ({ user, onClose }: EditModalProps) => {
    const [isLoading, setIsLoading] = useState<boolean>(false);
    const [error, setError] = useState<string | null>(null);
    const [showPassword, setShowPassword] = useState<boolean>(false);

    const form = useForm<z.infer<typeof formSchema>>({
        resolver: zodResolver(formSchema),
        defaultValues: {
            name: user.name,
            email: user.email,
            password: "",
            confirm_password: "",
        },
    });

    const toggleModalAdd = () => {
        onClose();
        setError(null);
    };

    async function onSubmit(values: z.infer<typeof formSchema>) {
        setError(null);
        setIsLoading(true);
        await axios
            .put(route("user.update", user.id), values)
            .then((data) => {
                const { message } = data.data;
                toast.success(`${message}`);
                toggleModalAdd();
                form.reset();
                router.reload();
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
    }

    return (
        <Modal
            onClose={toggleModalAdd}
            show={true}
            closeable={!isLoading}
            maxWidth="md"
        >
            <div className="p-4">
                <div className="w-full flex items-center justify-center">
                    <h2 className="text-md text-center font-bold">
                        Tambah Pengguna
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
                            className="space-y-5"
                        >
                            <FormField
                                control={form.control}
                                name="name"
                                render={({ field }) => (
                                    <FormItem>
                                        <FormLabel>Nama</FormLabel>
                                        <FormControl>
                                            <Input
                                                {...field}
                                                disabled={isLoading}
                                            />
                                        </FormControl>

                                        <FormMessage />
                                    </FormItem>
                                )}
                            />
                            <FormField
                                control={form.control}
                                name="email"
                                render={({ field }) => (
                                    <FormItem>
                                        <FormLabel>Email</FormLabel>
                                        <FormControl>
                                            <Input
                                                {...field}
                                                disabled={isLoading}
                                            />
                                        </FormControl>

                                        <FormMessage />
                                    </FormItem>
                                )}
                            />
                            <FormField
                                control={form.control}
                                name="password"
                                render={({ field }) => (
                                    <FormItem>
                                        <FormLabel>Password Baru</FormLabel>
                                        <FormControl>
                                            <Input
                                                type={
                                                    showPassword
                                                        ? "text"
                                                        : "password"
                                                }
                                                placeholder="*****"
                                                {...field}
                                                disabled={isLoading}
                                            />
                                        </FormControl>
                                        <FormMessage />
                                    </FormItem>
                                )}
                            />
                            <FormField
                                control={form.control}
                                name="confirm_password"
                                render={({ field }) => (
                                    <FormItem>
                                        <FormLabel>
                                            Konfirmasi Password
                                        </FormLabel>
                                        <FormControl>
                                            <Input
                                                type={
                                                    showPassword
                                                        ? "text"
                                                        : "password"
                                                }
                                                placeholder="*****"
                                                {...field}
                                                disabled={isLoading}
                                            />
                                        </FormControl>
                                        <FormMessage />
                                    </FormItem>
                                )}
                            />
                            <div className="flex items-center gap-x-2">
                                <input
                                    id="show-password"
                                    type="checkbox"
                                    checked={showPassword}
                                    onChange={() =>
                                        setShowPassword(!showPassword)
                                    }
                                />
                                <label
                                    htmlFor="show-password"
                                    className="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                                >
                                    Tampilkan password
                                </label>
                            </div>
                            <div className="mt-2">
                                <FormError message={error} />
                            </div>
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
    );
};
