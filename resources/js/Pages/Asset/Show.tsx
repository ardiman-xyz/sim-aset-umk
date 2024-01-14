import Authenticated from "@/Layouts/AuthenticatedLayout";
import { Head } from "@inertiajs/react";

const ShowPage = () => {
    return (
        <Authenticated>
            <Head title="Detail" />
            <div>show</div>
        </Authenticated>
    );
};

export default ShowPage;
