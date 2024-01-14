import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/Components/ui/card";
import { Asset } from "@/types/app";
import React from "react";
import Item from "./item";
import Categories from "./categories";
import { formatDate } from "@/Helpers/date";

interface DetailItemProps {
    asset: Asset;
}

const DetailItem = ({ asset }: DetailItemProps) => {
    return (
        <Card>
            <CardHeader>
                <CardTitle>Data Aset</CardTitle>
                <CardDescription>Detail data aset</CardDescription>
            </CardHeader>
            <CardContent>
                <div>
                    <div className="grid grid-cols-2 gap-4">
                        <Item
                            id={asset.id}
                            name="name"
                            title="Nama Barang"
                            value={asset.name}
                        />
                        <Item
                            id={asset.id}
                            name="quantity"
                            title="Jumlah Barang"
                            value={asset.quantity}
                        />
                        <Item
                            id={asset.id}
                            name="purchase_price"
                            title="Harga Barang (satuan)"
                            value={asset.purchase_price}
                            isCurrency
                            type="number"
                        />
                        <Item
                            id={asset.id}
                            name="total_price"
                            title="Total Harga"
                            value={asset.total_price}
                            isCurrency
                            type="number"
                            isEdited={false}
                        />
                        <Item
                            id={asset.id}
                            name="date_of_purchase"
                            title="Tanggal pengadaan"
                            value={asset.date_of_purchase}
                            isDate
                            type="date"
                        />
                        <Item
                            id={asset.id}
                            name=""
                            title="Kondisi"
                            value={asset.condition.name}
                        />
                        <Item
                            id={asset.id}
                            name=""
                            title="Jenis Akuisisi"
                            value={asset.acquisition_method.name}
                        />
                        <Categories
                            title="Kategori"
                            categories={asset.categories}
                        />
                    </div>
                </div>

                <p className="mt-6 text-muted-foreground text-sm">
                    Terakhir di update {formatDate(asset.created_at)}
                </p>
            </CardContent>
        </Card>
    );
};

export default DetailItem;
