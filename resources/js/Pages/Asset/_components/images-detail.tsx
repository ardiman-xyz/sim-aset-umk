import { Gallery } from "@/types/app";
import { SharedInertiaData } from "@/types/inertia";
import { usePage } from "@inertiajs/react";
import React from "react";

interface ImagesProps {
    images: Gallery[];
}

const ImagesDetail = ({ images }: ImagesProps) => {
    const { ziggy } = usePage<SharedInertiaData>().props;

    return (
        <ul className="w-full flex flex-col space-y-2 bg-white ro p-2 rounded shadow max-h-[410px] overflow-y-auto min-h-[410px]">
            {images.map((item, index) => (
                <li key={index} className="w-full ">
                    <img
                        src={ziggy?.url + "/storage/" + item.file}
                        alt="gambar"
                        className="w-full h-[178px] object-fill object-center"
                    />
                </li>
            ))}
        </ul>
    );
};

export default ImagesDetail;
