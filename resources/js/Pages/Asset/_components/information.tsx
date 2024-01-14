import React, {useState} from "react";
import {useForm} from "react-hook-form";

import {
    Card,
    CardContent,
    CardHeader,
    CardTitle,
} from "@/Components/ui/card"

import {ImageForm} from "@/Pages/Asset/_components/image-form";
import {Input} from "@/Components/ui/input";

import {Textarea} from "@/Components/ui/textarea";
import {useFormCreateStore} from "@/Context/useFormCreateAsetStore";
import {Button} from "@/Components/ui/button";
import {toast} from "sonner";
import axios from "axios";
import {router} from "@inertiajs/react";
import {RotateCw} from "lucide-react";

interface IProps {
    acquisitionMethods: {
        id: number;
        name: string;
    }[];
    categories: {
        id: number;
        name: string;
    }[];
    conditions: {
        id: number;
        name: string;
    }[]
}

export const Information = ({acquisitionMethods, categories, conditions}: IProps) => {

    const { register, handleSubmit, formState: { errors } } = useForm();
    const [isLoading, setIsLoading] = useState<boolean>(false);

    const { images, clearImages } = useFormCreateStore();

    const onSubmit = async (data: any) => {
        if(images.length < 1) {
            toast.error("Silahkan upload gambar minimal 1")
            return;
        }

        let finalData = {...data, images};
        setIsLoading(true)

        await axios.post('/assets', finalData, {
            headers: {
                'Content-Type': 'multipart/form-data'
            }
        })
            .then((res) => {
                const { message, data } = res.data;
                toast.success(`${message}`);
                clearImages();
                router.visit(route("asset.index"));
            })
            .catch(err => {
                const { data, status, statusText } = err.response;
                toast.error(`${statusText} ${status}`, {
                    description: `${data.message}`,
                });
            }).finally(() => {
                setIsLoading(false);
            })
    };

    return (
        <>
            <Card>
                <CardHeader>
                    <CardTitle>Informasi aset</CardTitle>
                </CardHeader>
                <CardContent className="space-y-6">
                    <ImageForm/>

                    <div className="w-full flex gap-x-10 items-center">
                        <div className="w-[250px] flex justify-end">
                            <p className="text-gray-600">Nama aset <span className="text-red-600">*</span></p>
                        </div>
                        <div className="w-full">
                            <Input placeholder="Masukkan" {...register("name", {required: true})}/>
                        </div>
                    </div>

                    <div className="w-full flex gap-x-10 items-center">
                        <div className="w-[250px] flex justify-end">
                            <p className="text-gray-600">Kategori <span className="text-red-600">*</span></p>
                        </div>
                        <div className="w-full">
                            <select
                                id="countries"
                                className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-[180px] p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                {...register("categories", {required: true})}
                            >
                                <option selected value={""}>Pilih</option>
                                {
                                    categories.map((category, index) => (
                                        <option value={category.id} key={index}>{category.name}</option>
                                    ))
                                }
                            </select>
                        </div>
                    </div>

                    <div className="w-full flex gap-x-10 items-center">
                        <div className="w-[250px] flex justify-end">
                            <p className="text-gray-600">Jenis Akuisisi <span className="text-red-600">*</span></p>
                        </div>
                        <div className="w-full">
                            <select
                                id="countries"
                                className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-[180px] p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                {...register("acquisition_methods", {required: true})}
                            >
                                <option selected value={""}>Pilih</option>
                                {
                                    acquisitionMethods.map((acquistion, index) => (
                                        <option value={acquistion.id} key={index}>{acquistion.name}</option>
                                    ))
                                }
                            </select>
                        </div>
                    </div>
                    <div className="w-full flex gap-x-10 items-center">
                        <div className="w-[250px] flex justify-end">
                            <p className="text-gray-600">Kondisi barang <span className="text-red-600">*</span></p>
                        </div>
                        <div className="w-full">
                            <select
                                id="countries"
                                className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-[180px] p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                {...register("condition", {required: true})}
                            >
                                <option selected value={""}>Pilih</option>
                                {
                                    conditions.map((condition, index) => (
                                        <option value={condition.id} key={index}>{condition.name}</option>
                                    ))
                                }
                            </select>
                        </div>
                    </div>
                    <div className="w-full flex gap-x-10 items-center">
                        <div className="w-[250px] flex justify-end">
                            <p className="text-gray-600">Tanggal pembelian <span className="text-red-600">*</span></p>
                        </div>
                        <div className="w-full">
                            <Input placeholder="Masukkan" type="date"
                                   className="w-[180px]" {...register("date_of_purchase", {required: true})}/>
                        </div>
                    </div>

                    <div className="w-full flex gap-x-10 items-center">
                        <div className="w-[250px] flex justify-end">
                            <p className="text-gray-600">Harga barang (satuan) <span className="text-red-600">*</span>
                            </p>
                        </div>
                        <div className="w-full">
                            <Input placeholder="Masukkan"
                                   type="number" {...register("purchase_price", {required: true})}/>
                        </div>
                    </div>

                    <div className="w-full flex gap-x-10 items-center">
                        <div className="w-[250px] flex justify-end">
                            <p className="text-gray-600">Jumlah barang<span className="text-red-600">*</span>
                            </p>
                        </div>
                        <div className="w-full">
                            <Input placeholder="Masukkan"
                                   className="w-max"
                                   type="number" {...register("quantity", {required: true})}/>
                        </div>
                    </div>

                    <div className="w-full flex gap-x-10">
                        <div className="w-[250px] flex justify-end">
                            <p className="text-gray-600">Deskripsi</p>
                        </div>
                        <div className="w-full">
                            <Textarea placeholder="Masukkan deskripsi" {...register("description", {required: false})}/>
                        </div>
                    </div>
                </CardContent>
            </Card>
            <div className="flex py-3 mt-3 justify-end">
                <Button disabled={isLoading} onClick={handleSubmit(onSubmit)} className="mt-5">
                    {isLoading && (
                        <RotateCw className="mr-2 h-4 w-4 animate-spin"/>
                    )}
                    Simpan data
                </Button>
            </div>
        </>
    )
}
