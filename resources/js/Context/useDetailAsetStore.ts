import { Asset } from "@/types/app";
import { create } from "zustand";

interface AssetStore {
    asset: Asset | null;
    setAsset: (asset: any) => void;
}

export const useAssetStore = create<AssetStore>((set) => ({
    asset: null,
    setAsset: (asset) => set({ asset }),
}));
