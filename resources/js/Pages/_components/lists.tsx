import React from "react";
import { Link } from "@inertiajs/react";

interface ImageUrl {
    file: string;
    id: number;
}

interface Asset {
    id: string;
    name: string;
    description: string;
    gallery: ImageUrl[];
}

interface AssetListProps {
    assets: Asset[];
}

export const Lists: React.FC<AssetListProps> = ({ assets }) => {
    return (
        <div
            className="w-3/4 overflow-y-auto"
            style={{ maxHeight: "calc(100vh - 64px)" }}
        >
            <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-3 gap-6 px-4">
                {assets.map((asset) => (
                    <div
                        key={asset.id}
                        className="bg-white rounded-md shadow-md"
                    >
                        {asset.gallery.length > 0 && (
                            <img
                                src={`/storage/${asset.gallery[0].file}`}
                                alt={asset.name}
                                className="w-full h-48 object-contain rounded-t-lg"
                            />
                        )}
                        <div className="p-6">
                            <h3 className="text-lg font-semibold mb-2">
                                {asset.name}
                            </h3>
                            {/* <Link
                                href="#"
                                className="text-blue-500 mt-4 inline-block"
                            >
                                View Details
                            </Link> */}
                        </div>
                    </div>
                ))}
            </div>
        </div>
    );
};
