import {Button} from "@/Components/ui/button";
import {router} from "@inertiajs/react";

export const FooterAction = () => {
    return (
        <div className="flex py-3 mt-5 justify-end">
            <div className="flex gap-x-3 px-4">
                <Button variant="outline">Kembali</Button>
                <Button>Simpan & tampilkan</Button>
            </div>
        </div>
    )
}
