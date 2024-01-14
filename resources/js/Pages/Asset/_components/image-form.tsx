import {ImagePlus, Trash2} from "lucide-react";
import React, {useRef, useState} from "react";
import {useFormCreateStore} from "@/Context/useFormCreateAsetStore";
import {
    AlertDialog, AlertDialogAction,
    AlertDialogContent,
    AlertDialogDescription, AlertDialogFooter,
    AlertDialogHeader,
    AlertDialogTitle
} from "@/Components/ui/alert-dialog";

interface ImageFile extends File {
    preview?: string;
}

export const ImageForm = () => {
    const inputRef = useRef<HTMLInputElement>(null);
    const [error, setError] = useState<string | null>(null);

    const { images, addImage, removeImage } = useFormCreateStore();

    const handleClick = () => {
        if(inputRef.current) {
            inputRef.current.click();
        }
    }

    const handleImageChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        if(e.target.files) {
            const filesArray = Array.from(e.target.files).filter(file => file.type.startsWith('image/')) as ImageFile[];

            let errors = [];
            let validFiles = [];

            for(let file of filesArray) {
                if(file.size > 1024 * 1024) {
                    errors.push(`File ${file.name} exceeds the maximum size of 1MB.`);
                } else {
                    validFiles.push(file);
                }
            }

            if(errors.length > 0) {
                setError(errors.join('\n'));
            }

            validFiles = validFiles.slice(0, 3 - images.length);
            validFiles.forEach(file => {
                file.preview = URL.createObjectURL(file);
            });

            validFiles.forEach(file => {
                addImage(file);
            });
        }
    }

    const handleConfirmError = () => {
        setError(null)
    }

    return (
        <>
            <div className="w-full flex gap-x-10">
                <div className="w-[200px] flex justify-end">
                    <p className="text-gray-600">Foto</p>
                </div>
                <div className="w-full">
                <p className="text-sm"><span className="text-sm text-red-600">*</span>Foto 1:1</p>
                    <div className="flex gap-x-3">
                        {images.map((image: ImageFile, i: number) =>
                            <div key={i} className="relative group">
                                <img
                                    key={i}
                                    src={image.preview}
                                    alt="Preview"
                                    className="bg-center bg-no-repeat bg-contain h-[120px] w-[120px] mt-2"
                                />
                                <div
                                    className="hidden absolute bottom-0 right-0 bg-gray-100  w-full group-hover:flex items-center justify-center">
                                    <Trash2
                                        onClick={() => {
                                            removeImage(image)
                                        }}
                                        className="w-4 h-4 cursor-pointer"
                                    />
                                </div>
                            </div>
                        )}
                        {
                            images.length !== 3 && (
                                <div
                                    className="w-[120px] h-[120px] border-dashed border border-gray-300 cursor-pointer hover:border-orange-400 rounded mt-2 flex flex-col items-center justify-center transition-all hover:bg-orange-50"
                                    onClick={handleClick}
                                >
                                    <ImagePlus className="h-6 w-6 text-gray-500 stroke-orange-500"/>
                                    <p className="text-xs text-orange-500">Tambahkan</p>
                                    <p className="text-xs text-orange-500">Foto ({images.length}/3)</p>
                                </div>
                            )
                        }
                    </div>
                    <input
                        type="file"
                        ref={inputRef}
                        style={{display: 'none'}}
                        onChange={handleImageChange}
                        multiple
                    />
                </div>
            </div>

            <AlertDialog open={error !== null}>
                <AlertDialogContent>
                    <AlertDialogHeader>
                        <AlertDialogTitle>Perhatian</AlertDialogTitle>
                        <AlertDialogDescription>
                            {
                                error
                            }
                        </AlertDialogDescription>
                    </AlertDialogHeader>
                    <AlertDialogFooter>
                        <AlertDialogAction onClick={handleConfirmError}>Konfirmasi</AlertDialogAction>
                    </AlertDialogFooter>
                </AlertDialogContent>
            </AlertDialog>
        </>
    )
}
