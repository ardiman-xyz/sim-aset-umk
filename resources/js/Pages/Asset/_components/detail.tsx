import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/Components/ui/card";
import { AcquisitionMethod, Asset, Category, Condition } from "@/types/app";
import Item from "./item";
import { formatDate } from "@/Helpers/date";
import ItemSelect from "./item-select";
import Categories from "./categories";

interface DetailItemProps {
    asset: Asset;
    conditions: Condition[];
    acquisitionMethods: AcquisitionMethod[];
    categories: Category[];
}

const DetailItem = ({
    asset,
    conditions,
    acquisitionMethods,
    categories,
}: DetailItemProps) => {
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
                        <ItemSelect
                            id={asset.id}
                            datas={conditions}
                            name="condition_id"
                            title="Kondisi"
                            value={asset.condition}
                        />

                        <ItemSelect
                            id={asset.id}
                            datas={acquisitionMethods}
                            name="acquisition_method_id"
                            title="Jenis Akuisi"
                            value={asset.acquisition_method}
                        />

                        <Categories
                            id={asset.id}
                            categories={categories}
                            data={asset.categories[0]}
                            title="Kategori"
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
