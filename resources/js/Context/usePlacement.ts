import { Building } from "@/types/app";
import { create } from "zustand";

interface PlacementStore {
    buildings:
        | {
              value: number;
              label: string;
          }[]
        | null;
    setBuilding: (building: any) => void;
}

export const usePlacementStore = create<PlacementStore>((set) => ({
    buildings: null,
    setBuilding: (buildings) => set({ buildings }),
}));
