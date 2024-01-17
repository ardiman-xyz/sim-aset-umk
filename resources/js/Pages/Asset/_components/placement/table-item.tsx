import { ChevronRight, QrCode, XIcon } from "lucide-react";

import { Hint } from "@/Components/HInt";
import { TableCell, TableRow } from "@/Components/ui/table";
import { Button } from "@/Components/ui/button";
import { Placement } from "@/types/app";
import { useState } from "react";
import CancelConfirmation from "./cancel-confirmation";
import QrcodeModal from "./qrcode-modal";

interface IProps {
    placement: Placement;
    index: number;
}

const TableItem = ({ placement, index }: IProps) => {
    const [modalCancel, setModalCancel] = useState<boolean>(false);
    const [modalQrcode, setModalQrcode] = useState<boolean>(false);

    return (
        <>
            <TableRow>
                <TableCell className="font-medium">{index + 1}</TableCell>
                <TableCell>
                    <div className="flex flex-row gap-x-1 items-center">
                        <p className="text-blue-800 underline cursor-pointer">
                            {placement.building.name}
                        </p>
                        <ChevronRight className="h-4 w-4" />
                        <p className="text-blue-800 underline cursor-pointer">
                            {placement.floor.name}
                        </p>
                        <ChevronRight className="h-4 w-4" />
                        <p className="text-blue-800 underline cursor-pointer">
                            {placement.room.name}
                        </p>
                    </div>
                </TableCell>
                <TableCell className="flex items-center justify-center">
                    <Hint description="Qrcode" side="top" sideOffset={2}>
                        <Button
                            variant="outline"
                            onClick={() => setModalQrcode(true)}
                        >
                            <QrCode />
                        </Button>
                    </Hint>
                </TableCell>
                <TableCell>
                    <Hint description="Batalkan penempatan" sideOffset={2}>
                        <div
                            onClick={() => setModalCancel(true)}
                            className="p-2 rounded-full border w-max cursor-pointer hover:bg-red-100 transition hover:border-red-200"
                        >
                            <XIcon className="w-4 h-4" />
                        </div>
                    </Hint>
                </TableCell>
            </TableRow>

            {modalCancel && (
                <CancelConfirmation
                    placementId={placement.id}
                    onClose={() => setModalCancel(false)}
                />
            )}

            {modalQrcode && (
                <QrcodeModal
                    data={placement}
                    onClose={() => setModalQrcode(false)}
                />
            )}
        </>
    );
};

export default TableItem;
