import { QRCodeCanvas, QRCodeSVG } from "qrcode.react";
import { XIcon } from "lucide-react";
import { usePage } from "@inertiajs/react";

import { Placement } from "@/types/app";
import { SharedInertiaData } from "@/types/inertia";

import Modal from "@/Components/Modal";

interface IProps {
    onClose: () => void;
    data: Placement;
}

const QrcodeModal = ({ onClose, data }: IProps) => {
    const { ziggy } = usePage<SharedInertiaData>().props;

    return (
        <Modal onClose={onClose} show={true} maxWidth="md">
            <div className="px-10 py-4">
                <div className="w-full flex justify-between items-center">
                    <h1 className="uppercase font-bold">QRCODE</h1>
                    <div
                        onClick={onClose}
                        className="p-2 rounded-full cursor-pointer transition hover:bg-gray-100"
                    >
                        <XIcon className="w-4 h-4" />
                    </div>
                </div>
                <div className="w-full mt-10 flex items-center justify-center flex-col">
                    <QRCodeCanvas
                        size={200}
                        value={`${ziggy?.url}/asset/${data.id}?_c=${data.code}`}
                    />
                    <p className="mt-3">{data.code}</p>
                </div>
            </div>
        </Modal>
    );
};

export default QrcodeModal;
