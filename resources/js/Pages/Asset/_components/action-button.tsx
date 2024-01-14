import { Hint } from "@/Components/HInt";
import { Button } from "@/Components/ui/button";
import { Printer, QrCode, Trash } from "lucide-react";
import { useState } from "react";
import DeleteConfirm from "./delete-confirm";

const ActionButton = () => {
    const [modalDelete, setModalDelete] = useState<boolean>(false);

    return (
        <div className="flex items-center gap-x-3">
            <Hint description="Cetak" side="top" sideOffset={3}>
                <Button className="mr-3" variant="outline">
                    <Printer />
                </Button>
            </Hint>
            <Hint description="Hapus" side="top" sideOffset={3}>
                <Button
                    onClick={() => setModalDelete(true)}
                    variant="destructive"
                >
                    <Trash />
                </Button>
            </Hint>

            {modalDelete && (
                <DeleteConfirm onClose={() => setModalDelete(false)} />
            )}
        </div>
    );
};

export default ActionButton;
