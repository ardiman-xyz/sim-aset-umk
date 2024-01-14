import {create} from 'zustand';

export type ImageFile = File & { preview?: string }

type Store = {
    images: ImageFile[];
    addImage: (image: ImageFile) => void;
    removeImage: (image: ImageFile) => void;
    clearImages: () => void;
};

export const useFormCreateStore = create<Store>((set) => ({
    images: [],
    addImage: (image) => set((state) => ({ images: [...state.images, image] })),
    removeImage: (imageToRemove) => set((state) => ({ images: state.images.filter((image) => image !== imageToRemove) })),
    clearImages: () => set(() => ({ images: [] })),
}));
