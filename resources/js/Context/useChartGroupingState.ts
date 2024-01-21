import { create } from "zustand";

interface ChartGroupingState {
    grouping: "month" | "year";
    setGrouping: (grouping: "month" | "year") => void;
}

export const useChartGroupingStore = create<ChartGroupingState>((set) => ({
    grouping: "month",
    setGrouping: (grouping) => set({ grouping }),
}));
