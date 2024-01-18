import { Layers, User, Wallet } from "lucide-react";
import React from "react";

const Cards = () => {
    return (
        <div>
            <div className="grid grid-cols-3 gap-6">
                <div className="rounded-xl bg-white  p-4 flex justify-between items-center">
                    <div className="">
                        <h1 className="text-lg text-zinc-600 ">Pengguna</h1>
                        <h1 className="text-4xl font-bold mt-1">20</h1>
                    </div>
                    <User className="w-12 h-12 stroke-orange-400" />
                </div>
                <div className="rounded-xl bg-white p-4 flex justify-between items-center">
                    <div className="">
                        <h1 className="text-lg text-zinc-600 ">Aset aktif</h1>
                        <h1 className="text-4xl font-bold mt-1">400</h1>
                    </div>
                    <Layers className="w-12 h-12 stroke-indigo-400" />
                </div>
                <div className="rounded-xl bg-white p-4 flex justify-between items-center">
                    <div className="">
                        <h1 className="text-lg text-zinc-600 ">Pengeluaran</h1>
                        <h1 className="text-4xl font-bold mt-1">300 Jt.</h1>
                    </div>
                    <Wallet className="w-12 h-12 stroke-green-600" />
                </div>
            </div>
        </div>
    );
};

export default Cards;
